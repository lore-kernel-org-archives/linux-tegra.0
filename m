From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/4] MBIST work around (WAR) for Tegra210
Date: Wed, 20 Dec 2017 10:12:10 +0000
Message-ID: <83325ffd-5b85-6288-63ac-5a938b948300@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510842542-16451-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/11/17 14:28, Peter De Schrijver wrote:
> This patch series introduces the Memory Built-In Self Test (MBIST)
> work around (WAR) needed when power ungating certain domains. More
> details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> implement the WAR in the Tegra210 clock driver, because most accesses are
> to CAR registers and for the VENC domain, we need to make sure the CSI
> clock source is not changed during the WAR execution.

In general, I don't have any problems with the proposal, as there is no
great way to implement the workaround AFAICT. My only thought was if we
could expose the mbist WAR as a 'reset' via the clk driver and use the
reset_control_xxx APIs to request and reset the mbist? Yes there is no
reset assert/deassert here, but the reset framework does have a 'reset'
hook to reset logic and if we are considering these WARs to reset the
mbist logic maybe it is not a complete hack/abuse of the API? Feel free
to tell me to get lost if it is a naff idea.

Cheers
Jon

-- 
nvpublic
