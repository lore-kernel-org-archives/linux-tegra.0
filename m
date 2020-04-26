From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 17:24:28 -0700
Message-ID: <94d6d159-950a-ee78-05a2-c37fb8fb9873@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
 <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
 <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
 <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
 <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
 <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a6f61c6-2049-fb61-3a80-e729708b3fb8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 5:19 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 02:44, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> How much of the T210 code could be reused by T186/194?
>> vi/csi are common driver where soc structure should be populated for
>> T186/T194
>>
>> Tegra210.c can't be reused for Tegra186/t194 as programming seq is a
>> whole lot diff
>>
> How are you going to separate Tegra210/186/194 drivers from each other?
> I don't think you'll want to have one "fat" driver that covers all those
> SoCs, won't you?
>
> In the end it should be three modules: tegra210-video.ko
> tegra186-video.ko tegra194-video.ko.
>
> Using a per-SoC OPS doesn't allow you to do that because the "root"
> driver will have to lookup OPS' code symbols of every SoC, and thus, the
> unwanted driver modules will get auto-loaded if you'll try to factor out
> the OPS into a separate driver modules.

tegra-video driver will be common for t210/186/194

we add corresponding compatibles to tegra-video and vi/csi drivers along=20
with that need to add tegra186_vi_soc, tegra194_vi_soc and implement=20
tegra186.c/tegra194.c

tegra-video driver updated for later tegra include updating drivers list=20
and subdevs list to add t186/t194 compatibles
