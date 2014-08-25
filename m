From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/8] Tegra124 EMC (external memory controller) support
Date: Mon, 25 Aug 2014 11:40:33 -0600
Message-ID: <53FB7511.9090205@wwwdotorg.org>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@linaro.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/11/2014 08:18 AM, Mikko Perttunen wrote:
> Hi everyone,
>
> this series adds support for the EMC (external memory controller) clock
> in the Tegra124 system-on-chip. The series has been tested on Jetson TK1.
>
> The first two patches remove the old "emc_mux" and "emc" clocks from the
> clock tree and the device tree bindings. This is, of course, not backwards
> compatible, but as these clocks have never been useful for anything
> (apart from maybe reading the boot rate of the EMC clock). If this is still
> not acceptable, the second patch can be dropped.
...

Mikko, this series had some comments, especially on the DT binding 
(patch 5/8) and how the MC/EMC drivers interact. Is there an updated 
version of the series? Or, is the series replaced by Tomeu Vizoso's work?
