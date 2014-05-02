From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Subject: Re: [PATCH v2 04/10] drm/nouveau/fb: add GK20A support
Date: Fri, 2 May 2014 09:26:08 +0300
Message-ID: <53633A80.2040403@nvidia.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
 <1398060142-7937-5-git-send-email-acourbot@nvidia.com>
 <20140422104052.GB22426@ulmo> <53572077.6090305@nvidia.com>
 <CAAVeFuKscuN-=HJOarbzFkG1ARq6-Nfc2pf1ibam9b61Cjbs6Q@mail.gmail.com>
 <20140428114437.GK19455@ulmo>
 <CAAVeFuJrs8Sv9UZg=Tj6gJeHOXj9YSX4gT1TNdrfXvVfrBHerQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFuJrs8Sv9UZg=Tj6gJeHOXj9YSX4gT1TNdrfXvVfrBHerQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 01.05.2014 07:49, Alexandre Courbot wrote:
> Agreed. Besides I hope the day won't come where we have to go through
> 2 layers of memory translation for the GPU...

That's actually the method of operation that gives us the best
performance. GPU likes big pages, and without IOMMU translation you'd
have a hard time finding enough contiguous physical memory.

Terje
