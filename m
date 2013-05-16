From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 7/8] usb: phy: tegra: Add error handling & clean up.
Date: Thu, 16 May 2013 15:08:29 -0600
Message-ID: <51954ACD.4070101@wwwdotorg.org>
References: <1368713582-29038-1-git-send-email-vbyravarasu@nvidia.com> <1368713582-29038-8-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368713582-29038-8-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/16/2013 08:13 AM, Venu Byravarasu wrote:
> Check return values from all GPIO APIs and handle errors accordingly.
> 
> Remove the call to clk_disable_unprepare(); this function does not
> prepare or enable the clock, so the error path should not disable or
> unprepare it.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> delta from v3:
> Modified comment section to indicate 'otg_ulpi_create returned NULL'.

I'm being really anal here, but note this wasn't a change to a comment,
but to the error message printed by the code.
