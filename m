From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 09/19] clk: tegra: add clkdev registration infra
Date: Tue, 15 Oct 2013 13:08:51 -0600
Message-ID: <525D92C3.9070507@wwwdotorg.org>
References: <1381848794-11761-1-git-send-email-pdeschrijver@nvidia.com> <1381848794-11761-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381848794-11761-10-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hiroshi Doyu <hdoyu@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 08:52 AM, Peter De Schrijver wrote:
> Add a common infra for registering clkdev. This allows decoupling clk
> registration from clkdev registration.

>  drivers/clk/tegra/clk-tegra114.c |  322 +++++++++++++++++++-------------------
>  drivers/clk/tegra/clk.c          |    9 +
>  drivers/clk/tegra/clk.h          |    7 +

It seems a little odd to have a patch which adds infra-structure and
converts Tegra114 alone, but not Tegra20/Tegra30. I would have expected
either:

* Patch to add infra-structure
* Patch to convert Tegra20
* Patch to convert Tegra30
* Patch to convert Tegra114

or:

* Patch to add infra-structure and convert Tegra20, Tegra30, and Tegra114.

Still, I suppose this isn't a particular problem, just something that
feels odd, so no need to split up all the patches to fit one of those
models. Just something to bear in mind next time.
