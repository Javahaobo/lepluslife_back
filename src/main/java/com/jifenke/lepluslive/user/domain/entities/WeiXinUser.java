package com.jifenke.lepluslive.user.domain.entities;


import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Created by wcg on 16/3/18.
 */
@Entity
@Table(name = "WEI_XIN_USER")
@Cacheable
public class WeiXinUser {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

  private String openId;

  private String appOpenId;  //app登录的openId

  private String unionId;

  private String nickname;
  private Long sex;
  private String language;
  private String city;
  private String province;
  private String country;


  private String headImageUrl;

  private String accessToken;

  private String refreshToken;

  private Integer hongBaoState = 0; //红包状态 0 未开红包, 1 已开红包;

  @OneToOne
  private LeJiaUser leJiaUser; //条形码

  Date dateCreated;
  Date lastUpdated;
  Date lastUserInfoDate;   //上次从微信服务器抓取用户信息的时间

  public Integer getHongBaoState() {
    return hongBaoState;
  }

  public void setHongBaoState(Integer hongBaoState) {
    this.hongBaoState = hongBaoState;
  }

  public LeJiaUser getLeJiaUser() {
    return leJiaUser;
  }

  public void setLeJiaUser(LeJiaUser leJiaUser) {
    this.leJiaUser = leJiaUser;
  }

  public String getOpenId() {
    return openId;
  }

  public void setOpenId(String openId) {
    this.openId = openId;
  }


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public Long getSex() {
    return sex;
  }

  public void setSex(Long sex) {
    this.sex = sex;
  }

  public String getLanguage() {
    return language;
  }

  public void setLanguage(String language) {
    this.language = language;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getHeadImageUrl() {
    return headImageUrl;
  }

  public void setHeadImageUrl(String headImageUrl) {
    this.headImageUrl = headImageUrl;
  }

  public Date getDateCreated() {
    return dateCreated;
  }

  public void setDateCreated(Date dateCreated) {
    this.dateCreated = dateCreated;
  }

  public Date getLastUpdated() {
    return lastUpdated;
  }

  public void setLastUpdated(Date lastUpdated) {
    this.lastUpdated = lastUpdated;
  }

  public Date getLastUserInfoDate() {
    return lastUserInfoDate;
  }

  public void setLastUserInfoDate(Date lastUserInfoDate) {
    this.lastUserInfoDate = lastUserInfoDate;
  }

  public String getAccessToken() {
    return accessToken;
  }

  public void setAccessToken(String accessToken) {
    this.accessToken = accessToken;
  }

  public String getRefreshToken() {
    return refreshToken;
  }

  public void setRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
  }

  public String getAppOpenId() {
    return appOpenId;
  }

  public void setAppOpenId(String appOpenId) {
    this.appOpenId = appOpenId;
  }

  public String getUnionId() {
    return unionId;
  }

  public void setUnionId(String unionId) {
    this.unionId = unionId;
  }
}
