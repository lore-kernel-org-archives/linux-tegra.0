From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [RFC 4/5] drm: Introduce drm_set_unique()
Date: Wed, 23 Apr 2014 12:48:00 +0200
Message-ID: <CANq1E4R3S4HdV8OcKw4jk2iLiMJgCPe1m=iNxaA_KfnaM0RFyQ@mail.gmail.com>
References: <1398179373-29966-1-git-send-email-thierry.reding@gmail.com>
 <1398179373-29966-5-git-send-email-thierry.reding@gmail.com>
 <20140422154807.GT10722@phenom.ffwll.local>
 <20140423071714.GB31226@ulmo>
 <20140423084057.GY10722@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140423084057.GY10722@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

Hi

On Wed, Apr 23, 2014 at 10:40 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Apr 23, 2014 at 09:17:16AM +0200, Thierry Reding wrote:
>> On second thought, wouldn't this be better located in drm_stub.c? It
>> isn't really related to the IOCTL code except that one of the IOCTLs now
>> uses the information set by this function. Logically I think it belongs
>> with the likes of drm_dev_alloc() and drm_dev_register().
>
> Yeah makes sense. Tbh the entire split-up of these core drm functions is
> still a bit messy, so I don't mind if it's a bit inconsistent really. We
> can do the suffling when someone bothers with the kerneldoc for all of
> them and pulls it into the drm docbook.

During drm_dev_*() cleanup, I tried to keep the following structure:
  drm_drv.c: global drm-module setup
  drm_stub.c: drm_device allocation, registration and lifetime management
  drm_fops.c: reference-implementation of the drm file_operations

The only thing that's wrongly placed is ioctl handling (which somehow
ended up in drm_drv.c instead of drm_fops.c). drm_stub.c is where all
the generic and mandatory DRM device handling is placed so yeah, I'd
put the set_unique() there.

Thanks
David
