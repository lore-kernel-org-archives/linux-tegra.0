From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 4 May 2020 07:36:05 -0700
Message-ID: <834b9295-d46a-dd01-2496-2c24a8e7a8e4@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <f1cbb602-163e-a539-aaa5-c7e947a8945b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f1cbb602-163e-a539-aaa5-c7e947a8945b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 5/4/20 12:44 AM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +/*
>> + * VI channel input data type enum.
>> + * These data type enum value gets programmed into corresponding Tegra =
VI
>> + * channel register bits.
>> + */
>> +enum tegra_image_dt {
>> +	TEGRA_IMAGE_DT_YUV420_8 =3D 24,
>> +	TEGRA_IMAGE_DT_YUV420_10,
>> +
>> +	TEGRA_IMAGE_DT_YUV420CSPS_8 =3D 28,
>> +	TEGRA_IMAGE_DT_YUV420CSPS_10,
>> +	TEGRA_IMAGE_DT_YUV422_8,
>> +	TEGRA_IMAGE_DT_YUV422_10,
>> +	TEGRA_IMAGE_DT_RGB444,
>> +	TEGRA_IMAGE_DT_RGB555,
>> +	TEGRA_IMAGE_DT_RGB565,
>> +	TEGRA_IMAGE_DT_RGB666,
>> +	TEGRA_IMAGE_DT_RGB888,
>> +
>> +	TEGRA_IMAGE_DT_RAW6 =3D 40,
>> +	TEGRA_IMAGE_DT_RAW7,
>> +	TEGRA_IMAGE_DT_RAW8,
>> +	TEGRA_IMAGE_DT_RAW10,
>> +	TEGRA_IMAGE_DT_RAW12,
>> +	TEGRA_IMAGE_DT_RAW14,
>> +};
> Are these format IDs common to all Tegra SoCs or they unique to T210?
Common for all SoCs
