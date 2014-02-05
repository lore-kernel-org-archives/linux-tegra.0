From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC 10/16] drm/nouveau/timer: skip calibration on GK20A
Date: Wed, 05 Feb 2014 13:27:36 -0700
Message-ID: <52F29EB8.5040906@wwwdotorg.org>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>	<1391224618-3794-11-git-send-email-acourbot@nvidia.com>
	<CACAvsv4T=TRb05OtkxG=t1+Ou9=Of9c-ALWkHJjKYpNi2aGs5Q@mail.gmail.com>
	<52F0A72B.8030900@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <52F0A72B.8030900@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <skeggsb@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Eric Brower <ebrower@nvidia.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Terje Bergstrom <tbergstrom@nvidia.com>, Ken Adams <KAdams@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 02/04/2014 01:39 AM, Alexandre Courbot wrote:
> On 02/04/2014 12:55 PM, Ben Skeggs wrote:
>> On Sat, Feb 1, 2014 at 1:16 PM, Alexandre Courbot
>> <acourbot@nvidia.com> wrote:
>>> GK20A's timer is directly attached to the system timer and cannot be
>>> calibrated. Skip the calibration phase on that chip since the
>>> corresponding registers do not exist.
>> Just a curiosity:  What timer resolution does the HW initialise at?
> 
> On T124 the timer input is the oscillator clock, which depending on the
> device can run between 12 and 48Mhz (IIUC).

On the one Tegra124 board we support upstream, the crystal is 12MHz. I
believe this is a typical/common value; almost all the Tegra boards we
support upstream run at this rate.
