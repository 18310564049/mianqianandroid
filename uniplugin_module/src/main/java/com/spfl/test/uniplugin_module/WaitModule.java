package com.spfl.test.uniplugin_module;

import io.dcloud.feature.uniapp.annotation.UniJSMethod;
import io.dcloud.feature.uniapp.bridge.UniJSCallback;
import io.dcloud.feature.uniapp.common.UniModule;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSON;
import android.util.Log;
import android.app.Activity;
import android.content.Intent;

import com.bairuitech.anychat.fishbanksdk.AnyChatRemoteSDK;
import com.bairuitech.anychat.fishbanksdk.VideoFinshRecordEvent;
import com.bairuitech.anychat.fishbanksdk.business.videochat.modle.BRAnyChatFishResult;


import android.app.Activity;

public class WaitModule extends UniModule {
    String TAG = "TestModule";
    public static int REQUEST_CODE = 1000;

    //run ui thread
    @UniJSMethod(uiThread = true)
    public void testAsyncFunc1(JSONObject options, UniJSCallback callback) {
        Log.e(TAG, "testAsyncFunc--"+options);
        if(callback != null) {
            JSONObject data = new JSONObject();
            data.put("code", "success");
            callback.invoke(data);
            //callback.invokeAndKeepAlive(data);
        }
    }

    @UniJSMethod (uiThread = true)
    public void testAsyncFunc2(JSONObject options){

        if(mUniSDKInstance != null && mUniSDKInstance.getContext() instanceof Activity) {
            Log.e(TAG, "testAsyncFunc1--"+options);
            Intent intent = new Intent(mUniSDKInstance.getContext(), NativePageActivity.class);
            ((Activity)mUniSDKInstance.getContext()).startActivityForResult(intent, REQUEST_CODE);
        }
    }
    @UniJSMethod (uiThread = true)
    public void testAsyncFunc(JSONObject options) {
        String taskBeanJson = JSON.toJSONString(options);
        Log.e("=====", "InterviewRemote:" +JSON.toJSONString(options));
        AnyChatRemoteSDK.getInstance().startByAgent(mUniSDKInstance.getContext(), taskBeanJson, new VideoFinshRecordEvent() {
            /**
             * 业务办理异常回调,用于上层调用者根据回调方法,做相关调用异常的处理
             */
            @Override
            public void onError(BRAnyChatFishResult result) {
                Log.e("=====OnError", "InterviewRemote:" +JSON.toJSONString(result));
//                showToast(result.errMsg);
//                UIManager.actionSelectInterviewTypeClass(BaseActivity.this, true);
            }

            /**
             * 业务办理完成回调 用于上层调用者根据回调方法,作相关业务办理完成的提示
             */
            @Override
            public void onRecordCompleted(BRAnyChatFishResult result) {
                Log.e("=====onRecordCompleted", "InterviewRemote:"+JSON.toJSONString(result));
//                showToast(result.errMsg);
//                UIManager.actionSelectInterviewTypeClass(BaseActivity.this, true);
            }

            @Override
            public void onLive() {

            }
        });
    }

}
