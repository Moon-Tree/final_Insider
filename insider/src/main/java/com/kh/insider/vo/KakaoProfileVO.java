package com.kh.insider.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class KakaoProfileVO {

	public Long id;
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;

	@Data
	@JsonIgnoreProperties(ignoreUnknown=true)
	public class Properties {

		public String nickname;

	}


@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class KakaoAccount {

	public Boolean profile_nickname_needs_agreement;
	public Profile profile;
	public Boolean hasEmail;
	public Boolean email_needs_agreement;
	public Boolean is_email_valid;
	public Boolean is_email_verified;
	public String email;
	public String age_range;
	private String gender;
	private String phone_number;
	private String birthyear;
	private String birthday;
	

	




	@Data
	@JsonIgnoreProperties(ignoreUnknown=true)
	public class Profile {

		public String nickname;

	}

}
}