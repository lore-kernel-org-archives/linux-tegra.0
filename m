From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] Doc: dt: i2c: tegra: add dt binding for i2c-tegra
Date: Tue, 19 Mar 2013 11:35:22 -0600
Message-ID: <5148A1DA.6040304@wwwdotorg.org>
References: <1363599350-25187-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1363599350-25187-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: rob@landley.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 03:35 AM, Laxman Dewangan wrote:
> Add documentation for device tree binding of NVIDIA's Tegra i2c
> controller driver.
> 
> Describing all compatible values used for diffenent Tegra SoCs
> in details in this documentation.

I have applied this to Tegra's for-3.10/dt branch. I fixed a couple of
typos and capitalization errors. I also trimmed the patch to include
only a single example; the description in the text is enough to get the
rest right, so there's no need to include exhaustive examples.
