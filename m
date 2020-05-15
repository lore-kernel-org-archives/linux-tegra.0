From: Steve McIntyre <steve@einval.com>
Subject: Re: [PATCH v4 4/6] partitions/efi: Support GPT entry lookup at a
 non-standard location
Date: Fri, 15 May 2020 11:03:30 +0100
Message-ID: <20200515100320.GB30674@tack.einval.com>
References: <20200515014143.12984-1-digetx@gmail.com>
 <20200515014143.12984-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200515014143.12984-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, Nils =?iso-8859-1?Q?=D6stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 15, 2020 at 04:41:41AM +0300, Dmitry Osipenko wrote:
>Most of consumer-grade NVIDIA Tegra devices use a proprietary bootloader
>that can't be easily replaced because it's locked down using Secure Boot
>cryptography singing and the crypto keys aren't given to a device owner.
              ^^^^^^^ typo
>These devices usually have eMMC storage that is partitioned using a custom
>NVIDIA Tegra partition table format.  Of course bootloader and other
>"special things" are stored on the eMMC storage, and thus, the partition
>format can't be changed.

...

-- 
Steve McIntyre, Cambridge, UK.                                steve@einval.com
"Further comment on how I feel about IBM will appear once I've worked out
 whether they're being malicious or incompetent. Capital letters are forecast."
 Matthew Garrett, http://www.livejournal.com/users/mjg59/30675.html
