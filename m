From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/6] gpu: drm: tegra: Prime support
Date: Sat, 24 Nov 2012 21:59:32 +0200
Message-ID: <50B12724.7020503@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-6-git-send-email-tbergstrom@nvidia.com> <20121123215528.GB21555@avionic-0098.adnet.avionic-design.de> <50B0733D.4040002@nvidia.com> <20121124191445.GE26154@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124191445.GE26154-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24.11.2012 21:14, Thierry Reding wrote:
> I still don't see how that's relevant here. IOMMU support has explicitly
> been removed as you mentioned in your introductory email and none of the
> functionality in this patch is in any way specific to Tegra. Right?

You're right - my point became moot once we disabled IOMMU. Arto, can we
revive the generic code?

Terje
