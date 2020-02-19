From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v1] partitions/efi: Add 'gpt_sector' kernel cmdline
 parameter
Date: Wed, 19 Feb 2020 08:27:38 -0800
Message-ID: <20200219162738.GA10644@infradead.org>
References: <20200219162339.16192-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200219162339.16192-1-digetx@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, Colin Cross <ccross@android.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, linux-efi@vger.kernel.org, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 19, 2020 at 07:23:39PM +0300, Dmitry Osipenko wrote:
> The gpt_sector=<sector> causes the GPT partition search to look at the
> specified sector for a valid GPT header if the GPT is not found at the
> beginning or the end of block device.
> 
> In particular this is needed for NVIDIA Tegra consumer-grade Android
> devices in order to make them usable with the upstream kernel because
> these devices use a proprietary / closed-source partition table format
> for the EMMC and it's impossible to change the partition's format. Luckily
> there is a GPT table in addition to the proprietary table, which is placed
> in uncommon location of the EMMC storage and bootloader passes the
> location to kernel using "gpt gpt_sector=<sector>" cmdline parameters.
> 
> This patch is based on the original work done by Colin Cross for the
> downstream Android kernel.

I don't think a magic command line is the way to go.  The best would be
to reverse-engineer the proprietary partition table format.  If that is
too hard we can at least key off the odd GPT location based of it's
magic number.
