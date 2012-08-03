From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: turn on UART A clock at boot
Date: Fri, 03 Aug 2012 12:01:40 -0600
Message-ID: <501C1204.3010004@wwwdotorg.org>
References: <1343170200-28228-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343170200-28228-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/24/2012 04:50 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Some boards use UART D for the main serial console, and some use UART A.
> UART D's clock is listed in board-dt-tegra20.c's clock table, whereas
> UART A's clock is not. This causes the clock code to think UART A's
> clock is unsed. The common clock framework turns off unused clocks at
> boot time. This makes the kernel appear to hang. Add UART A's clock into
> the clock table to prevent this. Eventually, this requirement should be
> handled by the UART driver, and/or properties in a board-specific device
> tree file.

Applied to for-3.7/common-clk.
