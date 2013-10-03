From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: PLLE spread spectrum control
Date: Thu, 03 Oct 2013 09:23:55 -0600
Message-ID: <524D8C0B.90707@wwwdotorg.org>
References: <1380209654-25458-1-git-send-email-pdeschrijver@nvidia.com> <524B28EA.40702@wwwdotorg.org> <20131003105228.GK3973@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131003105228.GK3973-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/03/2013 04:52 AM, Peter De Schrijver wrote:
> On Tue, Oct 01, 2013 at 09:56:26PM +0200, Stephen Warren wrote:
>> On 09/26/2013 09:34 AM, Peter De Schrijver wrote:
>>> Add spread spectrum control for PLLE in Tegra114.
>>
>> It would be useful to have some description of the end-user-visible
>> benefit of this change; why is it useful?
> 
> spread spectrum clocking is a technique to reduce EMI caused by the clock
> signal by modulating the frequency with a low frequency signal. This should
> reduce interference with eg. Wifi or cellular modems on the same board.

Great. The intent of my request was for that information to be included
in the patch description.
