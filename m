From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
Date: Wed, 06 May 2020 23:42:17 +0000
Message-ID: <20200506234218.4E11D2082E__42377.7656907745$1588808547$gmane$org@mail.kernel.org>
References: <20200501072756.25348-1-jonathanh@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200501072756.25348-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgstable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.6.8, v5.4.36, v4.19.119, v4.14.177, v4.9.220, v4.4.220.

v5.6.8: Build OK!
v5.4.36: Build OK!
v4.19.119: Build OK!
v4.14.177: Failed to apply! Possible dependencies:
    5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
    b8656c673a6b ("arm64: tegra: Add device tree for the Tegra194 P2972-0000 board")
    f69ce393ec48 ("arm64: tegra: Add GPIO controller on Tegra194")
    f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")

v4.9.220: Failed to apply! Possible dependencies:
    5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
    99575bceebd6 ("arm64: tegra: Add NVIDIA P2771 board support")
    b8656c673a6b ("arm64: tegra: Add device tree for the Tegra194 P2972-0000 board")
    f69ce393ec48 ("arm64: tegra: Add GPIO controller on Tegra194")
    f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")

v4.4.220: Failed to apply! Possible dependencies:
    0f279ebdf3ce ("arm64: tegra: Add NVIDIA Tegra132 Norrin support")
    2cc85bd90337 ("arm64: tegra: Add NVIDIA P2571 board support")
    34b4f6d0599e ("arm64: tegra: Add Tegra132 support")
    5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree")
    5d17ba6e638e ("arm64: tegra: Add support for Google Pixel C")
    63023e95bec0 ("arm64: tegra: Add NVIDIA P2371 board support")
    99575bceebd6 ("arm64: tegra: Add NVIDIA P2771 board support")
    b8656c673a6b ("arm64: tegra: Add device tree for the Tegra194 P2972-0000 board")
    f69ce393ec48 ("arm64: tegra: Add GPIO controller on Tegra194")
    f89b58ce71a9 ("arm64: tegra: Add ethernet controller on Tegra194")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
