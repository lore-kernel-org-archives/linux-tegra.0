From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/7] soc/tegra: pmc: Implement
 tegra_io_pad_is_powered()
Date: Wed, 11 Jul 2018 16:23:14 +0100
Message-ID: <3ced704b-2a8b-b78c-3b1e-6c2d7562edcc@nvidia.com>
References: <1531317693-3520-1-git-send-email-avienamo@nvidia.com>
 <1531317693-3520-4-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531317693-3520-4-git-send-email-avienamo@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 11/07/18 15:01, Aapo Vienamo wrote:
> Implement a function to query whether a pad is in deep power down mode.
Can you elaborate on why this public function is needed and who will be
using this?

Cheers
Jon

-- 
nvpublic
