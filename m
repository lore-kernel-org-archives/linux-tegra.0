From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 10/12] drm/nouveau/graph: add GK20A support
Date: Wed, 2 Apr 2014 23:03:19 +0900
Message-ID: <CAAVeFuLimi8Mzmqs0Y1OQv6ZJxgQd6Y2bfyF7hmP5_wcPya-gA@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-11-git-send-email-acourbot@nvidia.com>
 <CACAvsv4yQuPeoGMW6+k7ChsCZWCjpyBYhEMUomQH2QRrxkW=-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv4yQuPeoGMW6+k7ChsCZWCjpyBYhEMUomQH2QRrxkW=-w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 26, 2014 at 1:24 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> On Mon, Mar 24, 2014 at 6:42 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> Add a GR device for GK20A based on NVE4, with the correct classes
>> definitions (GK20A's 3D class is 0xa297).
>>
>> Most of the NVE4 code can be used on GK20A, so make relevant bits of
>> NVE4 available to other chips as well.
> This will need a bit of a rebase on top of the tree I mentioned
> earlier (also queued for drm-next now), where I've further split out
> and named the various chunks of state.

Will do that.

>
> Does GK104 match entirely correctly, or just happen to work?  I could
> probably hunt down the GK20A netlist images and check that actually :)

Do you mean, the init sequence? I haven't checked in detail (we are
certainly doing things differently in the non-DRM driver), but the
registers seem to match and the GPU is able to render after that. I
admit I have not looked much further for now.

The only register that does not exist on GK20A is 0x260, but when
accessing it Nouveau will be able to continue unharmed after a memory
fault.
