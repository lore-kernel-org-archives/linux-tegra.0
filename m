From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH resend 2/2] clk: tegra: add ac97 controller clock
Date: Wed, 17 Apr 2013 09:11:23 -0600
Message-ID: <516EBB9B.1000109@wwwdotorg.org>
References: <1366011105-2351-1-git-send-email-dev@lynxeye.de> <1366011105-2351-2-git-send-email-dev@lynxeye.de> <516E92C7.6070700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <516E92C7.6070700-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/17/2013 06:17 AM, Prashant Gaikwad wrote:
> On Monday 15 April 2013 01:01 PM, Lucas Stach wrote:
>> AC97 controller clock is hardwired to pll_a_out0.
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> ---
> 
> It was not there in previous implementation neither do we implement it
> in our downstream kernel.
> 
> Lucas, are you using this clock anywhere?

Yes, there's an AC'97 driver upstream now, which Lucas wrote. It's used
on the Colibri T20 board.
