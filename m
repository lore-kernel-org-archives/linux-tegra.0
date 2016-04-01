From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V8 0/4] Add generic PM domain support for Tegra
Date: Fri, 01 Apr 2016 16:47:10 -0700
Message-ID: <7h1t6oops1.fsf@baylibre.com>
References: <1459329316-27293-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1459329316-27293-1-git-send-email-jonathanh@nvidia.com> (Jon
	Hunter's message of "Wed, 30 Mar 2016 10:15:12 +0100")
Sender: linux-pm-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ulf Hansson <ulf.hansson@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Jon Hunter <jonathanh@nvidia.com> writes:

> Adds generic PM domain support for Tegra SoCs but this series only
> enables support for it on Tegra 64-bit devices. There is no reason why
> this cannot be enable for Tegra 32-bit devices, but to keep the patch
> series to a minimum only 64-bit devices are enabled so far.
>
> This series has been boot tested on Tegra210 as well as various 32-bit
> Tegra platforms.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
