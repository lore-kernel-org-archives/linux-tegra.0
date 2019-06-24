From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Date: Mon, 24 Jun 2019 00:04:13 -0700
Message-ID: <20190624070413.GA23846@infradead.org>
References: <20190623173743.24088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623173743.24088-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Don't we have a device tree problem here if there is a domain covering
them?  I though we should only pick up an IOMMU for a given device
if DT explicitly asked for that?
