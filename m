From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: Support Tegra30 in decompressor UART setup
Date: Tue, 3 Jan 2012 10:03:01 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F10E9@HQMAIL01.nvidia.com>
References: <1324587719-32731-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324587719-32731-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Thursday, December 22, 2011 2:02 PM:
> On Tegra20, the UART clock runs at 216MHz, whereas on Tegra30 it runs at
> 408MHz. Modify arch_decomp_setup() to detect Tegra20-vs-Tegra30 at run-
> time, and program the correct divisor.
> 
> This makes uncompressor messages work correctly on Tegra30. This also
> fixes early printk, assuming zImage is used and this setup code runs.

I'll be posting a V2 for this patch soon; I'll rework it to use Tegra's
CHIPID register instead of a random GIC register, which should make the
code a little more future-proof.

-- 
nvpublic
