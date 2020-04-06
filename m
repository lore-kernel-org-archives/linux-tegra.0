From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 11:58:55 -0700
Message-ID: <a972950d-5860-2b77-b5ad-90044b8deb94@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <ca9a792f-ff5e-c82b-c2bc-32c4875e558d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ca9a792f-ff5e-c82b-c2bc-32c4875e558d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/5/20 12:37 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int tegra_csi_init(struct host1x_client *client)
>> +{
>> +     struct tegra_csi *csi =3D host1x_client_to_csi(client);
>> +     struct tegra_video_device *vid =3D dev_get_drvdata(client->host);
>> +     int ret;
>> +
>> +     vid->csi =3D csi;
>> +
>> +     INIT_LIST_HEAD(&csi->csi_chans);
>> +
>> +     if (pm_runtime_enabled(csi->dev)) {
>> +             ret =3D pm_runtime_get_sync(csi->dev);
>> +             if (ret < 0) {
>> +                     dev_err(csi->dev,
>> +                             "failed to get runtime PM: %d\n", ret);
>> +                     pm_runtime_put_noidle(csi->dev);
>> +                     return ret;
>> +             }
>> +     } else {
> RPM is supposed to be always available on Tegra nowadays.

Sorry I was not sure if its all the time enabled, so added in v6.

Will remove check and explicit runtime calls...
