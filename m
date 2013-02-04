From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v5 07/10] ARM: tegra: Define Tegra114 CAR binding
Date: Mon, 04 Feb 2013 14:16:44 -0700
Message-ID: <5110253C.3070005@wwwdotorg.org>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com> <1359713962-16822-8-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1359713962-16822-8-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Prashant Gaikwad <pgaikwad@nvidia.com>, Simon Glass <sjg@chromium.org>, Mike Turquette <mturquette@linaro.org>, Joseph Lo <josephl@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 02/01/2013 03:18 AM, Peter De Schrijver wrote:
> The device tree binding models Tegra114 CAR (Clock And Reset) as a single
> monolithic clock provider.
...
> +- #clock-cells : Should be 1.
> +  In clock consumers, this cell represents the clock ID exposed by the CAR.
...
> +  222	pll_u
> +  223	pll_u_480M
> +  224	pll_u_60M
> +  225	pll_u_48M
> +  226	pll_u_12M

I notice here that we have separate clock IDs for the various PLL u
outputs. We don't have this on Tegra20 or Tegra30, but I wonder if we
should have them there too?
