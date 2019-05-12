From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 6/6] regulator: max77620: Support Maxim 77663
Date: Sun, 12 May 2019 17:08:15 +0300
Message-ID: <f8f67e00-0544-c999-92e0-3998c2f70ee7@gmail.com>
References: <20190505154325.30026-1-digetx@gmail.com>
 <20190505154325.30026-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505154325.30026-7-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

05.05.2019 18:43, Dmitry Osipenko пишет:
> Add support for Maxim 77663.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Hello Mark,

Just want to get yours attention to that Lee picked up the patches into
the MFD tree, excluding this patch. I assume this one will have to go
via the regulator's tree.
