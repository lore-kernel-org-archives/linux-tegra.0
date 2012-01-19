From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2] arm/tegra: Support Tegra30 in decompressor UART setup
Date: Wed, 18 Jan 2012 20:21:39 -0800
Message-ID: <20120119042139.GD7145@quad.lixom.net>
References: <1325628347-22140-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325628347-22140-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 03, 2012 at 03:05:47PM -0700, Stephen Warren wrote:
> On Tegra20, the UART clock runs at 216MHz, whereas on Tegra30 it runs at
> 408MHz. Modify arch_decomp_setup() to detect Tegra20-vs-Tegra30 at run-
> time, and program the correct divisor.
> 
> This makes uncompressor messages work correctly on Tegra30. This also
> fixes early printk, assuming zImage is used and this setup code runs.
> 
> v2: Use CHIPID register to differentiate between chips, rather than a
> GIC register. This should be more future-proof. Volatile is required
> to prevent the compiler transforming the 32-bit apb_misc register read
> into an 8-bit read of address 1 higher, since the HW only supports 32-
> bit accesses, and will hang on an 8-bit access.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied.


-Olof
