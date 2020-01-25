class MainAuthorizer < Jets::Authorizer::Base
  authorizer(
    name: 'MyCognito', identity_source: 'Authorization',
    type: :cognito_user_pools,
    provider_arns: ['arn:aws:cognito-idp:ap-northeast-1:333187377846:userpool/ap-northeast-1_WQMCb1gmB'],
  )
end
