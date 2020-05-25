From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] iommu/tegra-smmu: Add missing locks around mapping
 operations
Date: Mon, 25 May 2020 22:34:47 +0300
Message-ID: <c6819193-6200-b7a6-57e4-c763d1a7129e@gmail.com>
References: <20200524183755.3774-1-digetx@gmail.com>
 <20200525083556.GA2382769@ulmo>
 <ffa2f98f-1809-e4f0-009e-d06dcde0ed49@gmail.com>
 <20200525122016.GB2393266@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200525122016.GB2393266@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

25.05.2020 15:20, Thierry Reding пишет:
...
> Do we have a good way to find out how bad exactly the contention would
> be when using a mutex?

I'm now having a second thought about it. We don't need to care about
that scenario at all because it's a software-design defect of the
upstream Host1x driver that it maps gathers dynamically. The defect can
be fixed and then the potential problem won't exist at all.

Neither of the drivers that are using Tegra SMMU need the IOMMU mapping
operations to be performed under spinlock, so mutex will be good a
variant. I'll make a v2 with a mutex, thank you for the suggestion.
