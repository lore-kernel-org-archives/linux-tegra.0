From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: remove unneccessary 'else' after
 'return'statement
Date: Sat, 5 Jul 2014 13:49:03 +0200
Message-ID: <20140705134903.89ec088a6b90e48be9c36f89@gmx.de>
References: <20140704195746.GA4346@ThinkPad> <20140704205941.GA7406@jak-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20140704205941.GA7406@jak-x230>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Julian Andres Klode <jak@jak-linux.org>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Lebioda <pawel.lebioda89@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Fri, 4 Jul 2014 22:59:41 +0200
Julian Andres Klode <jak@jak-linux.org> wrote:

> On Fri, Jul 04, 2014 at 09:57:50PM +0200, Pawel Lebioda wrote:
> > Hi,
> >
> > This patch fixes the following warning reported by checkpatch.pl:
> > 
> > WARNING: else is not generally useful after a break or return
> > #235: FILE: drivers/staging/nvec/nvec.c:235:
> > 
> > Regards
> > Pawel Lebioda
> > 
> > Signed-off-by: Pawel Lebioda <pawel.lebioda89@gmail.com>
> >  drivers/staging/nvec/nvec.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Hi Pawel,
> 
> Please format your patches correctly. There should be no
> "Hi", no "Regards", etc. After the signed off should be a
> dashed line.
> 
> Use git format-patch to format patches and you can send
> them using git-send-email.

yes, this way you reduce some apply-burdon from Greg. Ideally,
you would combine all patches (one patch per checkpatch warning)
in a common thread like this:

git-format-patch --cover-letter --thread -s <first commit of your
patches>

This way you could add some comments (if any) to the cover letter
and just keep the plain checkpatch message in the other patches. This
has also the advantage that the maintainers only have to ack the "cover
letter".

Marc
 
-- 
Marc Dietrich <marvin24@gmx.de>
