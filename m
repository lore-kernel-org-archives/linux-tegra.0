From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 12:32:35 -0700
Message-ID: <1b23178b-0e5c-c97e-434c-f9cc3c02805b@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <34a49a30-71f2-5b24-20a4-7d98ae37cefa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/30/20 6:38 AM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +/**
>> + * struct tegra_csi_ops - Tegra CSI operations
>> + *
>> + * @csi_streaming: programs csi hardware to enable or disable streaming=
.
>> + * @csi_err_recover: csi hardware block recovery in case of any capture=
 errors
>> + *		due to missing source stream or due to improper csi input from
>> + *		the external source.
>> + */
>> +struct tegra_csi_ops {
>> +	int (*csi_streaming)(struct tegra_csi_channel *csi_chan, u8 pg_mode,
>> +			     int enable);
> What about to split csi_streaming() into csi_start_streaming() /
> csi_stop_streaming()?
>
> This will make tegra_csi_ops to be consistent with the tegra_ve_ops. A
> separated start/stop operations are somewhat more natural to have in
> general.

vi ops is for vb2_ops which has separate start/stop so has seperate=20
start/stop for vi ops.

csi is subdev and csi ops is for v4l2_subdev_ops which as s_stream=20
callback only.

So, created single stream function for csi to match same as subdev_ops.
