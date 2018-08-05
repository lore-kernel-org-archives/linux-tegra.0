From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1] memory: tegra: Block DMA for clients HW on a faulty memory access
Date: Sun, 05 Aug 2018 03:37:26 +0300
Message-ID: <1797693.ge5mZLuUEu@dimapc>
References: <20180508165841.13758-1-digetx@gmail.com> <2607799.I2xByD6lqT@dimapc> <89f0794e-affa-dba0-9684-582ce5570cad@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <89f0794e-affa-dba0-9684-582ce5570cad@kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sunday, 5 August 2018 03:11:57 MSK Mikko Perttunen wrote:
> One potential issue is with host1x clients where userspace processes can
> submit jobs with invalid memory accesses (addresses not mapped to
> IOMMU). If when such a failure happens, we disable the DMA for the whole
> host1x client, unrelated userspace processes may see failures even
> though there is no problem with their jobs.

Good point, I'll take a look at partial resurrection of patch [0]. Anyway I 
think it's still better to fail even the unrelated jobs, rather than to have 
corrupted memory.

[0] https://github.com/grate-driver/linux/commit/
c0351a9d01491af2b2fefc162de1c2e4fcfaa94c#diff-20226be476307cb7ec9f60e26a9c30deR378
