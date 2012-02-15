From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 00/10] Add tegra30 support for secondary cores
Date: Wed, 15 Feb 2012 13:27:43 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178FACB954@HQMAIL01.nvidia.com>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328831277-21002-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Thursday, February 09, 2012 4:48 PM:
> This patchset introduces support for secondary cores on tegra30. It also
> introduces some functions for the flowcontroller and adds basic support for
> tegra30 powerdomains.

The code looks fine to me. I do notice the following when running
"shutdown -h now":

[   27.762124] SMP: failed to stop secondary CPUs

So, this patch series makes the secondary cores boot OK, but not shut
down it appears. Is that expected? It's probably something we can fix
with a following on patch rather than re-spinning this series though?

-- 
nvpublic
