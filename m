From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 01/10] Documentation: dt-bindings: mailbox: tegra: Add
 binding for HSP mailbox
Date: Tue, 19 Jul 2016 10:36:27 -0600
Message-ID: <578E570B.8060404@wwwdotorg.org>
References: <20160719091723.30919-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160719091723.30919-1-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Matthew Longnecker <MLongnecker@nvidia.com>, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sivaram Nair <sivaramn@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 07/19/2016 03:17 AM, Joseph Lo wrote:
> Add DT binding for the Hardware Synchronization Primitives (HSP). The
> HSP is designed for the processors to share resources and communicate
> together. It provides a set of hardware synchronization primitives for
> interprocessor communication. So the interprocessor communication (IPC)
> protocols can use hardware synchronization primitive, when operating
> between two processors not in an SMP relationship.

Acked-by: Stephen Warren <swarren@nvidia.com>

A couple of nits below that you might want to fix up when posting the 
final version of the series; your call.

> diff --git a/include/dt-bindings/mailbox/tegra186-hsp.h b/include/dt-bindings/mailbox/tegra186-hsp.h

> + */
> +
> +
> +#ifndef _DT_BINDINGS_MAILBOX_TEGRA186_HSP_H

Nit: There are 2 blank lines there.

> +#endif	/* _DT_BINDINGS_MAILBOX_TEGRA186_HSP_H */

Nit: Personally I hate "filename" comments on the #endif, since it's 
just one more place to update if the file moves or is copied.
