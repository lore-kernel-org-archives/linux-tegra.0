From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add clock properties for devices of Tegra124
Date: Thu, 17 Oct 2013 11:33:11 -0600
Message-ID: <52601F57.4090709@wwwdotorg.org>
References: <1381218460-23123-1-git-send-email-josephl@nvidia.com> <525464F0.5020704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525464F0.5020704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2013 02:02 PM, Stephen Warren wrote:
> On 10/08/2013 01:47 AM, Joseph Lo wrote:
>> This patch adds clock properties for devices in the DT for basic support
>> of Tegra124 SoC.
> 
> This looks reasonable. I'll wait until the clock driver stuff is
> finalized and merged, then apply this on top.

Actually, I can't apply this yet, since it relies on the file
<dt-bindings/clock/tegra124-car.h>, which is being added for 3.13 in a
patch in the clock tree. This will have to wait until v3.13-rc1 or later.
