package com.spfl.test.uniplugin_module;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;


import com.bairuitech.anychat.fishbanksdk.AnyChatRemoteSDK;
import com.bairuitech.anychat.fishbanksdk.VideoFinshRecordEvent;
import com.bairuitech.anychat.fishbanksdk.business.videochat.modle.BRAnyChatFishResult;
import android.util.Log;
public class NativePageActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.e("=====OnError", "InterviewRemote:" );
        String taskBeanJson = "TestModule";
        AnyChatRemoteSDK.getInstance().startByAgent(this, taskBeanJson, new VideoFinshRecordEvent() {
            /**
             * 业务办理异常回调,用于上层调用者根据回调方法,做相关调用异常的处理
             */
            @Override
            public void onError(BRAnyChatFishResult result) {
                Log.e("=====OnError", "InterviewRemote:" );
            }

            /**
             * 业务办理完成回调 用于上层调用者根据回调方法,作相关业务办理完成的提示
             */
            @Override
            public void onRecordCompleted(BRAnyChatFishResult result) {
                Log.e("=====onRecordCompleted", "InterviewRemote:");
            }

            @Override
            public void onLive() {

            }
        });
    }
}
