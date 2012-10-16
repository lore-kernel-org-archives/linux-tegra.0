From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra30: clk: Fix output_rate overflow
Date: Tue, 16 Oct 2012 11:29:13 -0600
Message-ID: <507D9969.6020503@wwwdotorg.org>
References: <1350376309-24557-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350376309-24557-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2012 02:31 AM, Mark Zhang wrote:
> Change the type of variable from "unsigned long" to "u64".
> This avoids the overflow while clock rate calculating.

Thanks, applied to Tegra's for-3.7/fixes-for-rc2 branch.

Prashant, this same bug was found before in another round_rate() or
similar function, and I'd asked you to audit the entire Tegra clock
driver for any similar issues. Could you (and/or Mark) please take
another look at the entire driver to make sure we don't keep finding
this issue clock-by-clock. Thanks.
