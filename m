From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/6] gpu: drm: tegra: Prime support
Date: Mon, 26 Nov 2012 11:30:26 +0200
Message-ID: <50B336B2.2030104@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-6-git-send-email-tbergstrom@nvidia.com> <20121123215528.GB21555@avionic-0098.adnet.avionic-design.de> <50B0733D.4040002@nvidia.com> <20121124191445.GE26154@avionic-0098.adnet.avionic-design.de>,<50B12724.7020503@nvidia.com> <7DC9167CA73B39468DFA1D07FF67A6A85150E61DDB@DEMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7DC9167CA73B39468DFA1D07FF67A6A85150E61DDB-LZBqo6t42cZDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.11.2012 09:33, Arto Merilainen wrote:
> AFAIK dma-mapping API is not smart enough to determine whether a
> given buffer is already mapped to some address space. It just maps
> and potentially creates duplicates (please correct me if I am wrong).
> Therefore, if the "generic case solution" is applied to our "specific
> case", there will always be duplicates and I do not think that is a
> good practice. I also considered doing a smart optimisation here, but
> dma-mapping API did not seem to support querying of the address space
> of a certain device.

This coupled with the facts that CMA helper calls dma mapping API, and
that CMA helper doesn't know if IOMMU is enabled or disabled for a
particular device, we need to keep the prime support as tegradrm
specific code for now.

Terje
