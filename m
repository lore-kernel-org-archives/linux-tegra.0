From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 0/3] drm/nouveau: support for probing platform devices
Date: Wed, 02 Jul 2014 10:23:00 -0600
Message-ID: <53B431E4.60404@wwwdotorg.org>
References: <1403760814-26148-1-git-send-email-acourbot@nvidia.com>
 <CAAVeFu+O+Z7kQ3Sre=WKkcYoxXYUx4zCzZK8cVMj1WAtwA5eMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFu+O+Z7kQ3Sre=WKkcYoxXYUx4zCzZK8cVMj1WAtwA5eMg@mail.gmail.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2014 03:09 AM, Alexandre Courbot wrote:
> On Thu, Jun 26, 2014 at 2:33 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> This series adds support for probing platform devices on Nouveau, as well as
>> the DT bindings for GK20A. It doesn't enable the GPU yet on Tegra boards since
>> a few extra things need to be supported before that.
>>
>> This version is mostly identical to v2 but fixes an important issue: the drvdata
>> must be set to the drm_device for sysfs to work, so the platform device
>> structure now includes the nouveau_device flattened into it to let us compute
>> the address of one from the other. Since the platform device resources (clocks,
>> regulators, ...) need to live longer than the nouveau_device, they are stored
>> into their own structure which is allocated separately.
...
> Stephen, Thierry,
> 
> Ben has merged the first patch of this series into the Nouveau tree.
> Could you get patches 2 and 3 through the Tegra tree? Thanks!

I've applied patches 2 and 3 to Tegra's for-3.17/dt branch.
