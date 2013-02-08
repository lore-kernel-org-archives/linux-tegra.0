From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v6 08/10] ARM: dt: Add references to tegra_car clocks
Date: Fri, 08 Feb 2013 10:16:13 -0700
Message-ID: <511532DD.2080306@wwwdotorg.org>
References: <1360330602-30472-1-git-send-email-pdeschrijver@nvidia.com> <1360330602-30472-9-git-send-email-pdeschrijver@nvidia.com> <20130208140301.GA23979@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130208140301.GA23979-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/08/2013 07:03 AM, Felipe Balbi wrote:
> Hi,
> 
> On Fri, Feb 08, 2013 at 03:36:40PM +0200, Peter De Schrijver
> wrote:
>> tegra_car: clock { -		compatible = "nvidia,tegra114-car,
>> nvidia,tegra30-car"; +		compatible = "nvidia,tegra114-car";
> 
> trailing change or intentional ?

I believe it's intentional since the HW isn't fully
backwards-compatible. However, the commit description should mention this.
