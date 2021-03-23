package com.lxx.shiro;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

public class MyRealm extends AuthorizingRealm {

    //负责用户授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    //负责用户认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("负责用户的登录---用户认证");
        // 获取登录的用户信息
        UsernamePasswordToken passwordToken = (UsernamePasswordToken) authenticationToken;
        //简单的判断一下有没有生成passwordToken！
        if (passwordToken.getUsername() != null && passwordToken.getUsername().length() > 0) {
            return new SimpleAuthenticationInfo(passwordToken.getUsername(), passwordToken.getPassword(), getName());
        } else {
            return null;
        }
    }
}
