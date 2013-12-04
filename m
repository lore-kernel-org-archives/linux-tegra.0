From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: fix DEBUG_LL combined with LPAE
Date: Wed, 04 Dec 2013 12:37:00 -0700
Message-ID: <529F845C.3020402@wwwdotorg.org>
References: <1385419003-11348-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385419003-11348-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/25/2013 03:36 PM, Stephen Warren wrote:
> The DEBUG_LL UART address is mapped as an MMU section, hence, the
> virtual address must be section-aligned. Sections are 1MB without LPAE
> and 2MB with LPAE. Tegra's virtual address was only aligned to 1MB, and
> hence the mapping was set up incorrectly with LPAE enabled, thus causing
> a hang early during boot. Fix this by picking a different virtual address
> that is aligned to 2MB.

I've applied this series to Tegra's for-3.14/soc branch.
