From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: fix blink clock rate
Date: Sun, 01 Dec 2013 12:21:17 -0700
Message-ID: <529B8C2D.3000300@wwwdotorg.org>
References: <1384991242-13596-1-git-send-email-swarren@wwwdotorg.org> <20131129152241.GM9712@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129152241.GM9712-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 08:22 AM, Thierry Reding wrote:
> On Wed, Nov 20, 2013 at 04:47:18PM -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> The blink clock rate needs to be configured, or it will run at
>> ~1Hz rather than the desired 32KHz. If it runs at the wrong rate,
>> e.g. the SDIO WiFi on Seaboard and Cardhu will fail to be
>> detected.
> 
> How is this related to WiFi?

The "blink" clock output from Tegra is connected to the WiFi module,
which then uses it for something; it probably has a PLL connected to
it that drives all the internal circuitry.
