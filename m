From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Wed, 16 Jul 2014 17:22:03 +0200
Message-ID: <6322144.IB6iKDb6TK@wuerfel>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <17053542.QUGvfkeRmc@wuerfel> <20140716151427.GA22027@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140716151427.GA22027@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 16 July 2014 17:14:29 Thierry Reding wrote:
> > 
> > Ok, I'll have a look. I think when this becomes a separate driver, it
> > should also have its own header file, so maybe you can in the meantime
> > make it a local header file in mach-tegra until we have found a good
> > place for it.
> 
> Why do you think it should be a separate header? We already have a
> couple in include/linux and I'm not sure it's useful to add even more.
> If anything I would've thought it made sense to move the content of the
> other headers into tegra-soc.h.

I very much dislike the idea of having a per-vendor header file that
everything gets crammed into. We should try to have proper subsystems
and generic interfaces for these wherever possible.

	Arnd
