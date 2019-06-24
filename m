From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Date: Mon, 24 Jun 2019 15:55:04 +0300
Message-ID: <e7ecff74-ef8e-fd7e-1be2-0f3c60abc6f8@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190624070413.GA23846@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624070413.GA23846@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.06.2019 10:04, Christoph Hellwig пишет:
> Don't we have a device tree problem here if there is a domain covering
> them?  I though we should only pick up an IOMMU for a given device
> if DT explicitly asked for that?
> 

There is no specific domain that "covering them". The IOMMU domain is allocated
dynamically during of the Tegra DRM's driver initialization (see tegra_drm_load) and
then all of DRM devices are attached to that domain once all of the DRM sub-drivers
are probed successfully. On Tegra SoCs it's up to software (driver) to decide how to
separate hardware devices from each other, in a case of DRM we're putting all the
relevant graphics devices into a single domain. Is it even possible to express IOMMU
domain (not group!) assignments in a device-tree?
