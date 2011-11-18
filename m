From: KyongHo Cho <pullip.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: iommu: tegra: Add initial Tegra IOMMU driver
Date: Fri, 18 Nov 2011 19:19:53 +0900
Message-ID: <CAHQjnOM-N9suPrv_nSRQsxGCNrf77rFLNtRcOdsjyz_O6bGdpA@mail.gmail.com>
References: <1321527667-12923-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321527667-12923-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 17, 2011 at 8:01 PM,  <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hiroshi DOYU (3):
> =A0ARM: iommu: tegra/common: Initial support for IOVMM driver
> =A0ARM: iommu: tegra2: Initial support for GART driver
> =A0ARM: iommu: tegra3: Initial support for SMMU driver
>

Hi.

I found that those patches are not IOMMU API implementations.
I wonder why they need to be located in drivers/iommu?

Regards,

  KyongHo
