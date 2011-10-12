From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: Harmony: Configure PMC for low-level
 interrupts
Date: Wed, 12 Oct 2011 15:51:53 -0700
Message-ID: <20111012225153.GA25664@quad.lixom.net>
References: <1316643040-7998-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316643040-7998-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 21, 2011 at 04:10:40PM -0600, Stephen Warren wrote:
> Without this, the PMC continually detects an interrupt when the PMU_IRQ
> line is high, causing the tps6686x IRQ handler thread to hog an entire
> CPU.
> 
> This change was originally written by Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for Seaboard
> in the ChromeOS kernel.
> 
> Long-term, this should probably be moved into some kind of PMU driver,
> or perhaps integrated into the GPIO/IRQ/pinmux system?
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to for-3.2/features.


-Olof
