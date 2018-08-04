From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1] memory: tegra: Block DMA for clients HW on a faulty memory access
Date: Sat, 04 Aug 2018 14:53:19 +0300
Message-ID: <2607799.I2xByD6lqT@dimapc>
References: <20180508165841.13758-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508165841.13758-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday, 8 May 2018 19:58:41 MSK Dmitry Osipenko wrote:
> Currently Memory Controller informs about erroneous memory accesses done
> by memory clients and that's it. Let's make it to block whole HW unit
> that corresponds to the misbehaving memory client in order to try to avoid
> memory corruptions and to stop deliberate attempts of manipulation by a
> misbehaving client.

Guys, any comments? That is a kinda useful feature, in worst case only some of 
memory could get corrupted instead of trashing the whole memory. In my 
experience with T20/30, the interrupt handling latency is low and blocking 
happens immediately after the first page fault.
