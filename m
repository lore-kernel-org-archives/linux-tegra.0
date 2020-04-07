From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 7 Apr 2020 12:42:23 -0700
Message-ID: <4e076538-fe8a-7dae-e82c-663288e78b79@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <430efa4e-5435-7e2a-fe07-c3a0d0dc967e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <430efa4e-5435-7e2a-fe07-c3a0d0dc967e@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/7/20 12:39 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static const struct dev_pm_ops tegra_vi_pm_ops =3D {
>> +     SET_RUNTIME_PM_OPS(vi_runtime_suspend, vi_runtime_resume, NULL)
>> +};
> Aren't the suspend/resume ops needed?
Complete driver suspend/resume will be implemented later after next=20
series of sensor support
