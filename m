From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: boot_lock in platsmp.c
Date: Thu, 5 Jan 2012 17:12:03 +0200
Message-ID: <20120105151203.GO32619@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Colin,

What's the use of boot_lock in boot_secondary()? Is it to prevent concurrent
access to EVP_CPU_RESET_VECTOR? I'm looking into merging tegra30 SMP support
so I first need to understand how the existing code works.

Thanks,

Peter.
