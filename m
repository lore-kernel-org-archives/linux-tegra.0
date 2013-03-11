From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 4/5] ARM: DT: tegra114: add KBC controller DT entry
Date: Mon, 11 Mar 2013 23:29:26 +0530
Message-ID: <513E1B7E.8090203@nvidia.com>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com> <1362852678-13421-5-git-send-email-ldewangan@nvidia.com> <513E17C1.1070305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513E17C1.1070305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 11 March 2013 11:13 PM, Stephen Warren wrote:
> On 03/09/2013 11:11 AM, Laxman Dewangan wrote:
>> NVIDIA's Tegra114 SoCs have the matrix keyboard controller which
>> supports 11x8 type of matrix. The number of rows and columns
>> are configurable.
>>
>> Add DT entry for KBC controller with compatibility as "nvidia,tegra114-kbc",
>> "nvidia,tegra20-kbc".
> I thought the HW really wasn't compatible with Tegra20 due to the
> reduced number of rows/columns/pins supported?

Hw controller is really compatible. Only thing is that there is no 
physical pins on SoC for KBC-ROW11 to KBC-ROW15.
Because, there is no physical pins for ROW11 to ROW15, we asked to 
remove programming/reference this rows from  TRM of T114 to consistent 
with SoCs.
