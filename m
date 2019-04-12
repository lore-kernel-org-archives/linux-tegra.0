From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] memory: tegra: Introduce Tegra30 EMC driver
Date: Fri, 12 Apr 2019 17:01:28 +0300
Message-ID: <0e61d2a7-3f13-3868-954f-86562c546be1@gmail.com>
References: <20190411230221.31362-1-digetx@gmail.com>
 <20190411230221.31362-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411230221.31362-3-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.04.2019 2:02, Dmitry Osipenko пишет:
> Introduce driver for the External Memory Controller (EMC) found on Tegra30
> chips, it controls the external DRAM on the board. The purpose of this
> driver is to program memory timing for external memory on the EMC clock
> rate change.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

I realized that the MC_SAME_FREQ timing configuration need be properly handled for T30 and that is missed in this version. Will fix it up in v2. Although, seems it's not critical since things appear to work properly and probably only arbitration is not optimally configured because of the MC/EMC setup mismatch.  
