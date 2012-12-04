From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Tue, 4 Dec 2012 08:17:23 +0200
Message-ID: <50BD9573.2080802@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de> <50B73710.2040102@nvidia.com> <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de> <50B874C7.5030208@nvidia.com> <20121130103850.GA28367@avionic-0098.adnet.avionic-design.de> <50BCFB7E.4020007@wwwdotorg.org> <20121203210328.GA20884@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121203210328.GA20884@avionic-0098.adnet.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 03.12.2012 23:03, Thierry Reding wrote:
> What's really difficult to follow is if an ops structure is accessed via
> some global macro. It also breaks encapsulation because you have a
> global ops structure. That may even work fine for now, but it will break
> once you have more than a single host1x in a system. I know this will
> never happen, but all of a sudden it happens anyway and the code breaks.
> Doing this right isn't very hard and it will lead to a better design and
> is less likely to break at some point.

I agree that the chip ops access goes through too much indirection and
macro magic (which I already declared I hate), so we're going to design
something simpler.

Terje
