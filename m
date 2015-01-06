From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/4] ARM: tegra: Move out nyan-generic parts out from
 the nyan-big DT
Date: Tue, 06 Jan 2015 10:10:00 -0700
Message-ID: <54AC16E8.6060304@wwwdotorg.org>
References: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com> <1420540653-14816-3-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420540653-14816-3-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/06/2015 03:37 AM, Tomeu Vizoso wrote:
> In preparation for adding the DT for the nyan-blaze board.

"git format-patch -M" and/or "git format-patch -C" should make this 
patch a lot easier to review, since it'll show the patch as a file 
copy/rename rather than a full-file cut/paste.
