From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 0/3] drm/tegra: Remove space after parenthesis
Date: Tue, 5 Nov 2019 05:53:37 +0100
Message-ID: <20191105045337.GB1764@qmqm.qmqm.pl>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jamal Shareef <jamal.k.shareef@gmail.com>
Cc: outreachy-kernel@googlegroups.com, thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 04, 2019 at 06:23:19PM -0800, Jamal Shareef wrote:
> This patchset removes spaces after left open parenthesis.
> Issue found by checkpatch.

I'd say that those spaces make code easier to look at, so it would
be better to teach checkpatch to ignore cases like these.

Best Regards,
Micha³ Miros³aw
